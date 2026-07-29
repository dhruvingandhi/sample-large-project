# Explore: explore_1670
# Auto-generated LookML Explore File

include: "/views/domain_11/view_05011.view.lkml"
include: "/views/domain_13/view_05013.view.lkml"
include: "/views/domain_14/view_05014.view.lkml"
include: "/views/domain_15/view_05015.view.lkml"

explore: explore_1670 {
  label: "Explore Explore 1670"
  description: "Comprehensive analytics explore joining base view_05011 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_05011
  
  always_filter: {
    filters: [view_05011.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05011.created_at_date: "7 days"]
    unless: [view_05011.id, view_05011.status]
  }

  join: view_05013 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05011.user_id} = ${view_05013.id} ;;
    required_joins: []
  }

  join: view_05014 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05011.account_id} = ${view_05014.account_id} ;;
    required_joins: [view_05013]
  }

  join: view_05015 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05011.category} = ${view_05015.category} ;;
  }

  access_filter: {
    field: view_05011.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05011.is_deleted} = false ;;
}
