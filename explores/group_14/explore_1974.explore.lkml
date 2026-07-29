# Explore: explore_1974
# Auto-generated LookML Explore File

include: "/views/domain_23/view_05923.view.lkml"
include: "/views/domain_25/view_05925.view.lkml"
include: "/views/domain_26/view_05926.view.lkml"
include: "/views/domain_27/view_05927.view.lkml"

explore: explore_1974 {
  label: "Explore Explore 1974"
  description: "Comprehensive analytics explore joining base view_05923 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_05923
  
  always_filter: {
    filters: [view_05923.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05923.created_at_date: "7 days"]
    unless: [view_05923.id, view_05923.status]
  }

  join: view_05925 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05923.user_id} = ${view_05925.id} ;;
    required_joins: []
  }

  join: view_05926 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05923.account_id} = ${view_05926.account_id} ;;
    required_joins: [view_05925]
  }

  join: view_05927 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05923.category} = ${view_05927.category} ;;
  }

  access_filter: {
    field: view_05923.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05923.is_deleted} = false ;;
}
