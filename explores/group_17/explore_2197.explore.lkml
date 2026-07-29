# Explore: explore_2197
# Auto-generated LookML Explore File

include: "/views/domain_42/view_06592.view.lkml"
include: "/views/domain_44/view_06594.view.lkml"
include: "/views/domain_45/view_06595.view.lkml"
include: "/views/domain_46/view_06596.view.lkml"

explore: explore_2197 {
  label: "Explore Explore 2197"
  description: "Comprehensive analytics explore joining base view_06592 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_06592
  
  always_filter: {
    filters: [view_06592.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06592.created_at_date: "7 days"]
    unless: [view_06592.id, view_06592.status]
  }

  join: view_06594 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06592.user_id} = ${view_06594.id} ;;
    required_joins: []
  }

  join: view_06595 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06592.account_id} = ${view_06595.account_id} ;;
    required_joins: [view_06594]
  }

  join: view_06596 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06592.category} = ${view_06596.category} ;;
  }

  access_filter: {
    field: view_06592.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06592.is_deleted} = false ;;
}
