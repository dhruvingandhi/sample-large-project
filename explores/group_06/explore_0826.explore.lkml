# Explore: explore_0826
# Auto-generated LookML Explore File

include: "/views/domain_29/view_02479.view.lkml"
include: "/views/domain_31/view_02481.view.lkml"
include: "/views/domain_32/view_02482.view.lkml"
include: "/views/domain_33/view_02483.view.lkml"

explore: explore_0826 {
  label: "Explore Explore 0826"
  description: "Comprehensive analytics explore joining base view_02479 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_02479
  
  always_filter: {
    filters: [view_02479.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02479.created_at_date: "7 days"]
    unless: [view_02479.id, view_02479.status]
  }

  join: view_02481 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02479.user_id} = ${view_02481.id} ;;
    required_joins: []
  }

  join: view_02482 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02479.account_id} = ${view_02482.account_id} ;;
    required_joins: [view_02481]
  }

  join: view_02483 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02479.category} = ${view_02483.category} ;;
  }

  access_filter: {
    field: view_02479.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02479.is_deleted} = false ;;
}
