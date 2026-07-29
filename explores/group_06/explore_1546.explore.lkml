# Explore: explore_1546
# Auto-generated LookML Explore File

include: "/views/domain_39/view_04639.view.lkml"
include: "/views/domain_41/view_04641.view.lkml"
include: "/views/domain_42/view_04642.view.lkml"
include: "/views/domain_43/view_04643.view.lkml"

explore: explore_1546 {
  label: "Explore Explore 1546"
  description: "Comprehensive analytics explore joining base view_04639 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_04639
  
  always_filter: {
    filters: [view_04639.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04639.created_at_date: "7 days"]
    unless: [view_04639.id, view_04639.status]
  }

  join: view_04641 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04639.user_id} = ${view_04641.id} ;;
    required_joins: []
  }

  join: view_04642 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04639.account_id} = ${view_04642.account_id} ;;
    required_joins: [view_04641]
  }

  join: view_04643 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04639.category} = ${view_04643.category} ;;
  }

  access_filter: {
    field: view_04639.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04639.is_deleted} = false ;;
}
