# Explore: explore_2643
# Auto-generated LookML Explore File

include: "/views/domain_30/view_07930.view.lkml"
include: "/views/domain_32/view_07932.view.lkml"
include: "/views/domain_33/view_07933.view.lkml"
include: "/views/domain_34/view_07934.view.lkml"

explore: explore_2643 {
  label: "Explore Explore 2643"
  description: "Comprehensive analytics explore joining base view_07930 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_07930
  
  always_filter: {
    filters: [view_07930.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07930.created_at_date: "7 days"]
    unless: [view_07930.id, view_07930.status]
  }

  join: view_07932 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07930.user_id} = ${view_07932.id} ;;
    required_joins: []
  }

  join: view_07933 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07930.account_id} = ${view_07933.account_id} ;;
    required_joins: [view_07932]
  }

  join: view_07934 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07930.category} = ${view_07934.category} ;;
  }

  access_filter: {
    field: view_07930.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07930.is_deleted} = false ;;
}
