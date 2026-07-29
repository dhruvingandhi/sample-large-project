# Explore: explore_0279
# Auto-generated LookML Explore File

include: "/views/domain_38/view_00838.view.lkml"
include: "/views/domain_40/view_00840.view.lkml"
include: "/views/domain_41/view_00841.view.lkml"
include: "/views/domain_42/view_00842.view.lkml"

explore: explore_0279 {
  label: "Explore Explore 0279"
  description: "Comprehensive analytics explore joining base view_00838 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_00838
  
  always_filter: {
    filters: [view_00838.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00838.created_at_date: "7 days"]
    unless: [view_00838.id, view_00838.status]
  }

  join: view_00840 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00838.user_id} = ${view_00840.id} ;;
    required_joins: []
  }

  join: view_00841 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00838.account_id} = ${view_00841.account_id} ;;
    required_joins: [view_00840]
  }

  join: view_00842 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00838.category} = ${view_00842.category} ;;
  }

  access_filter: {
    field: view_00838.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00838.is_deleted} = false ;;
}
