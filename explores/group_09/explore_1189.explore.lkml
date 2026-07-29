# Explore: explore_1189
# Auto-generated LookML Explore File

include: "/views/domain_18/view_03568.view.lkml"
include: "/views/domain_20/view_03570.view.lkml"
include: "/views/domain_21/view_03571.view.lkml"
include: "/views/domain_22/view_03572.view.lkml"

explore: explore_1189 {
  label: "Explore Explore 1189"
  description: "Comprehensive analytics explore joining base view_03568 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_03568
  
  always_filter: {
    filters: [view_03568.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03568.created_at_date: "7 days"]
    unless: [view_03568.id, view_03568.status]
  }

  join: view_03570 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03568.user_id} = ${view_03570.id} ;;
    required_joins: []
  }

  join: view_03571 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03568.account_id} = ${view_03571.account_id} ;;
    required_joins: [view_03570]
  }

  join: view_03572 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03568.category} = ${view_03572.category} ;;
  }

  access_filter: {
    field: view_03568.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03568.is_deleted} = false ;;
}
