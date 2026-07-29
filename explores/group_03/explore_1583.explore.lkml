# Explore: explore_1583
# Auto-generated LookML Explore File

include: "/views/domain_50/view_04750.view.lkml"
include: "/views/domain_02/view_04752.view.lkml"
include: "/views/domain_03/view_04753.view.lkml"
include: "/views/domain_04/view_04754.view.lkml"

explore: explore_1583 {
  label: "Explore Explore 1583"
  description: "Comprehensive analytics explore joining base view_04750 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_04750
  
  always_filter: {
    filters: [view_04750.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04750.created_at_date: "7 days"]
    unless: [view_04750.id, view_04750.status]
  }

  join: view_04752 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04750.user_id} = ${view_04752.id} ;;
    required_joins: []
  }

  join: view_04753 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04750.account_id} = ${view_04753.account_id} ;;
    required_joins: [view_04752]
  }

  join: view_04754 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04750.category} = ${view_04754.category} ;;
  }

  access_filter: {
    field: view_04750.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04750.is_deleted} = false ;;
}
