# Explore: explore_2162
# Auto-generated LookML Explore File

include: "/views/domain_37/view_06487.view.lkml"
include: "/views/domain_39/view_06489.view.lkml"
include: "/views/domain_40/view_06490.view.lkml"
include: "/views/domain_41/view_06491.view.lkml"

explore: explore_2162 {
  label: "Explore Explore 2162"
  description: "Comprehensive analytics explore joining base view_06487 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_06487
  
  always_filter: {
    filters: [view_06487.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06487.created_at_date: "7 days"]
    unless: [view_06487.id, view_06487.status]
  }

  join: view_06489 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06487.user_id} = ${view_06489.id} ;;
    required_joins: []
  }

  join: view_06490 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06487.account_id} = ${view_06490.account_id} ;;
    required_joins: [view_06489]
  }

  join: view_06491 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06487.category} = ${view_06491.category} ;;
  }

  access_filter: {
    field: view_06487.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06487.is_deleted} = false ;;
}
