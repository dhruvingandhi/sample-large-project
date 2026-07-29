# Explore: explore_1825
# Auto-generated LookML Explore File

include: "/views/domain_26/view_05476.view.lkml"
include: "/views/domain_28/view_05478.view.lkml"
include: "/views/domain_29/view_05479.view.lkml"
include: "/views/domain_30/view_05480.view.lkml"

explore: explore_1825 {
  label: "Explore Explore 1825"
  description: "Comprehensive analytics explore joining base view_05476 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_05476
  
  always_filter: {
    filters: [view_05476.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05476.created_at_date: "7 days"]
    unless: [view_05476.id, view_05476.status]
  }

  join: view_05478 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05476.user_id} = ${view_05478.id} ;;
    required_joins: []
  }

  join: view_05479 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05476.account_id} = ${view_05479.account_id} ;;
    required_joins: [view_05478]
  }

  join: view_05480 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05476.category} = ${view_05480.category} ;;
  }

  access_filter: {
    field: view_05476.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05476.is_deleted} = false ;;
}
