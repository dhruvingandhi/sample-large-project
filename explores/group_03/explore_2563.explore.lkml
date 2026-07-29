# Explore: explore_2563
# Auto-generated LookML Explore File

include: "/views/domain_40/view_07690.view.lkml"
include: "/views/domain_42/view_07692.view.lkml"
include: "/views/domain_43/view_07693.view.lkml"
include: "/views/domain_44/view_07694.view.lkml"

explore: explore_2563 {
  label: "Explore Explore 2563"
  description: "Comprehensive analytics explore joining base view_07690 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_07690
  
  always_filter: {
    filters: [view_07690.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07690.created_at_date: "7 days"]
    unless: [view_07690.id, view_07690.status]
  }

  join: view_07692 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07690.user_id} = ${view_07692.id} ;;
    required_joins: []
  }

  join: view_07693 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07690.account_id} = ${view_07693.account_id} ;;
    required_joins: [view_07692]
  }

  join: view_07694 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07690.category} = ${view_07694.category} ;;
  }

  access_filter: {
    field: view_07690.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07690.is_deleted} = false ;;
}
