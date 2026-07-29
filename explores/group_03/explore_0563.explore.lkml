# Explore: explore_0563
# Auto-generated LookML Explore File

include: "/views/domain_40/view_01690.view.lkml"
include: "/views/domain_42/view_01692.view.lkml"
include: "/views/domain_43/view_01693.view.lkml"
include: "/views/domain_44/view_01694.view.lkml"

explore: explore_0563 {
  label: "Explore Explore 0563"
  description: "Comprehensive analytics explore joining base view_01690 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_01690
  
  always_filter: {
    filters: [view_01690.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01690.created_at_date: "7 days"]
    unless: [view_01690.id, view_01690.status]
  }

  join: view_01692 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01690.user_id} = ${view_01692.id} ;;
    required_joins: []
  }

  join: view_01693 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01690.account_id} = ${view_01693.account_id} ;;
    required_joins: [view_01692]
  }

  join: view_01694 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01690.category} = ${view_01694.category} ;;
  }

  access_filter: {
    field: view_01690.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01690.is_deleted} = false ;;
}
