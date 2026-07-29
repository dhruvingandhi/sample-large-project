# Explore: explore_2492
# Auto-generated LookML Explore File

include: "/views/domain_27/view_07477.view.lkml"
include: "/views/domain_29/view_07479.view.lkml"
include: "/views/domain_30/view_07480.view.lkml"
include: "/views/domain_31/view_07481.view.lkml"

explore: explore_2492 {
  label: "Explore Explore 2492"
  description: "Comprehensive analytics explore joining base view_07477 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_07477
  
  always_filter: {
    filters: [view_07477.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07477.created_at_date: "7 days"]
    unless: [view_07477.id, view_07477.status]
  }

  join: view_07479 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07477.user_id} = ${view_07479.id} ;;
    required_joins: []
  }

  join: view_07480 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07477.account_id} = ${view_07480.account_id} ;;
    required_joins: [view_07479]
  }

  join: view_07481 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07477.category} = ${view_07481.category} ;;
  }

  access_filter: {
    field: view_07477.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07477.is_deleted} = false ;;
}
