# Explore: explore_3974
# Auto-generated LookML Explore File

include: "/views/domain_23/view_11923.view.lkml"
include: "/views/domain_25/view_11925.view.lkml"
include: "/views/domain_26/view_11926.view.lkml"
include: "/views/domain_27/view_11927.view.lkml"

explore: explore_3974 {
  label: "Explore Explore 3974"
  description: "Comprehensive analytics explore joining base view_11923 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_11923
  
  always_filter: {
    filters: [view_11923.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11923.created_at_date: "7 days"]
    unless: [view_11923.id, view_11923.status]
  }

  join: view_11925 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11923.user_id} = ${view_11925.id} ;;
    required_joins: []
  }

  join: view_11926 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11923.account_id} = ${view_11926.account_id} ;;
    required_joins: [view_11925]
  }

  join: view_11927 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11923.category} = ${view_11927.category} ;;
  }

  access_filter: {
    field: view_11923.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11923.is_deleted} = false ;;
}
