# Explore: explore_0144
# Auto-generated LookML Explore File

include: "/views/domain_33/view_00433.view.lkml"
include: "/views/domain_35/view_00435.view.lkml"
include: "/views/domain_36/view_00436.view.lkml"
include: "/views/domain_37/view_00437.view.lkml"

explore: explore_0144 {
  label: "Explore Explore 0144"
  description: "Comprehensive analytics explore joining base view_00433 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_00433
  
  always_filter: {
    filters: [view_00433.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00433.created_at_date: "7 days"]
    unless: [view_00433.id, view_00433.status]
  }

  join: view_00435 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00433.user_id} = ${view_00435.id} ;;
    required_joins: []
  }

  join: view_00436 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00433.account_id} = ${view_00436.account_id} ;;
    required_joins: [view_00435]
  }

  join: view_00437 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00433.category} = ${view_00437.category} ;;
  }

  access_filter: {
    field: view_00433.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00433.is_deleted} = false ;;
}
