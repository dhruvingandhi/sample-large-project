# Explore: explore_3144
# Auto-generated LookML Explore File

include: "/views/domain_33/view_09433.view.lkml"
include: "/views/domain_35/view_09435.view.lkml"
include: "/views/domain_36/view_09436.view.lkml"
include: "/views/domain_37/view_09437.view.lkml"

explore: explore_3144 {
  label: "Explore Explore 3144"
  description: "Comprehensive analytics explore joining base view_09433 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_09433
  
  always_filter: {
    filters: [view_09433.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09433.created_at_date: "7 days"]
    unless: [view_09433.id, view_09433.status]
  }

  join: view_09435 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09433.user_id} = ${view_09435.id} ;;
    required_joins: []
  }

  join: view_09436 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09433.account_id} = ${view_09436.account_id} ;;
    required_joins: [view_09435]
  }

  join: view_09437 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09433.category} = ${view_09437.category} ;;
  }

  access_filter: {
    field: view_09433.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09433.is_deleted} = false ;;
}
