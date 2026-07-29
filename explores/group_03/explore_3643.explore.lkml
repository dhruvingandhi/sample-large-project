# Explore: explore_3643
# Auto-generated LookML Explore File

include: "/views/domain_30/view_10930.view.lkml"
include: "/views/domain_32/view_10932.view.lkml"
include: "/views/domain_33/view_10933.view.lkml"
include: "/views/domain_34/view_10934.view.lkml"

explore: explore_3643 {
  label: "Explore Explore 3643"
  description: "Comprehensive analytics explore joining base view_10930 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_10930
  
  always_filter: {
    filters: [view_10930.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10930.created_at_date: "7 days"]
    unless: [view_10930.id, view_10930.status]
  }

  join: view_10932 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10930.user_id} = ${view_10932.id} ;;
    required_joins: []
  }

  join: view_10933 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10930.account_id} = ${view_10933.account_id} ;;
    required_joins: [view_10932]
  }

  join: view_10934 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10930.category} = ${view_10934.category} ;;
  }

  access_filter: {
    field: view_10930.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10930.is_deleted} = false ;;
}
