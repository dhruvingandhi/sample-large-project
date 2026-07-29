# Explore: explore_1563
# Auto-generated LookML Explore File

include: "/views/domain_40/view_04690.view.lkml"
include: "/views/domain_42/view_04692.view.lkml"
include: "/views/domain_43/view_04693.view.lkml"
include: "/views/domain_44/view_04694.view.lkml"

explore: explore_1563 {
  label: "Explore Explore 1563"
  description: "Comprehensive analytics explore joining base view_04690 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_04690
  
  always_filter: {
    filters: [view_04690.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04690.created_at_date: "7 days"]
    unless: [view_04690.id, view_04690.status]
  }

  join: view_04692 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04690.user_id} = ${view_04692.id} ;;
    required_joins: []
  }

  join: view_04693 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04690.account_id} = ${view_04693.account_id} ;;
    required_joins: [view_04692]
  }

  join: view_04694 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04690.category} = ${view_04694.category} ;;
  }

  access_filter: {
    field: view_04690.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04690.is_deleted} = false ;;
}
