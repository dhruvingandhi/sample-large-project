# Explore: explore_1003
# Auto-generated LookML Explore File

include: "/views/domain_10/view_03010.view.lkml"
include: "/views/domain_12/view_03012.view.lkml"
include: "/views/domain_13/view_03013.view.lkml"
include: "/views/domain_14/view_03014.view.lkml"

explore: explore_1003 {
  label: "Explore Explore 1003"
  description: "Comprehensive analytics explore joining base view_03010 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_03010
  
  always_filter: {
    filters: [view_03010.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03010.created_at_date: "7 days"]
    unless: [view_03010.id, view_03010.status]
  }

  join: view_03012 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03010.user_id} = ${view_03012.id} ;;
    required_joins: []
  }

  join: view_03013 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03010.account_id} = ${view_03013.account_id} ;;
    required_joins: [view_03012]
  }

  join: view_03014 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03010.category} = ${view_03014.category} ;;
  }

  access_filter: {
    field: view_03010.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03010.is_deleted} = false ;;
}
