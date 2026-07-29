# Explore: explore_0717
# Auto-generated LookML Explore File

include: "/views/domain_02/view_02152.view.lkml"
include: "/views/domain_04/view_02154.view.lkml"
include: "/views/domain_05/view_02155.view.lkml"
include: "/views/domain_06/view_02156.view.lkml"

explore: explore_0717 {
  label: "Explore Explore 0717"
  description: "Comprehensive analytics explore joining base view_02152 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_02152
  
  always_filter: {
    filters: [view_02152.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02152.created_at_date: "7 days"]
    unless: [view_02152.id, view_02152.status]
  }

  join: view_02154 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02152.user_id} = ${view_02154.id} ;;
    required_joins: []
  }

  join: view_02155 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02152.account_id} = ${view_02155.account_id} ;;
    required_joins: [view_02154]
  }

  join: view_02156 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02152.category} = ${view_02156.category} ;;
  }

  access_filter: {
    field: view_02152.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02152.is_deleted} = false ;;
}
