# Explore: explore_2043
# Auto-generated LookML Explore File

include: "/views/domain_30/view_06130.view.lkml"
include: "/views/domain_32/view_06132.view.lkml"
include: "/views/domain_33/view_06133.view.lkml"
include: "/views/domain_34/view_06134.view.lkml"

explore: explore_2043 {
  label: "Explore Explore 2043"
  description: "Comprehensive analytics explore joining base view_06130 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_06130
  
  always_filter: {
    filters: [view_06130.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06130.created_at_date: "7 days"]
    unless: [view_06130.id, view_06130.status]
  }

  join: view_06132 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06130.user_id} = ${view_06132.id} ;;
    required_joins: []
  }

  join: view_06133 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06130.account_id} = ${view_06133.account_id} ;;
    required_joins: [view_06132]
  }

  join: view_06134 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06130.category} = ${view_06134.category} ;;
  }

  access_filter: {
    field: view_06130.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06130.is_deleted} = false ;;
}
