# Explore: explore_3670
# Auto-generated LookML Explore File

include: "/views/domain_11/view_11011.view.lkml"
include: "/views/domain_13/view_11013.view.lkml"
include: "/views/domain_14/view_11014.view.lkml"
include: "/views/domain_15/view_11015.view.lkml"

explore: explore_3670 {
  label: "Explore Explore 3670"
  description: "Comprehensive analytics explore joining base view_11011 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_11011
  
  always_filter: {
    filters: [view_11011.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11011.created_at_date: "7 days"]
    unless: [view_11011.id, view_11011.status]
  }

  join: view_11013 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11011.user_id} = ${view_11013.id} ;;
    required_joins: []
  }

  join: view_11014 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11011.account_id} = ${view_11014.account_id} ;;
    required_joins: [view_11013]
  }

  join: view_11015 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11011.category} = ${view_11015.category} ;;
  }

  access_filter: {
    field: view_11011.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11011.is_deleted} = false ;;
}
