# Explore: explore_3826
# Auto-generated LookML Explore File

include: "/views/domain_29/view_11479.view.lkml"
include: "/views/domain_31/view_11481.view.lkml"
include: "/views/domain_32/view_11482.view.lkml"
include: "/views/domain_33/view_11483.view.lkml"

explore: explore_3826 {
  label: "Explore Explore 3826"
  description: "Comprehensive analytics explore joining base view_11479 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_11479
  
  always_filter: {
    filters: [view_11479.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11479.created_at_date: "7 days"]
    unless: [view_11479.id, view_11479.status]
  }

  join: view_11481 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11479.user_id} = ${view_11481.id} ;;
    required_joins: []
  }

  join: view_11482 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11479.account_id} = ${view_11482.account_id} ;;
    required_joins: [view_11481]
  }

  join: view_11483 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11479.category} = ${view_11483.category} ;;
  }

  access_filter: {
    field: view_11479.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11479.is_deleted} = false ;;
}
