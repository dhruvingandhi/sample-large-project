# Explore: explore_2372
# Auto-generated LookML Explore File

include: "/views/domain_17/view_07117.view.lkml"
include: "/views/domain_19/view_07119.view.lkml"
include: "/views/domain_20/view_07120.view.lkml"
include: "/views/domain_21/view_07121.view.lkml"

explore: explore_2372 {
  label: "Explore Explore 2372"
  description: "Comprehensive analytics explore joining base view_07117 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_07117
  
  always_filter: {
    filters: [view_07117.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07117.created_at_date: "7 days"]
    unless: [view_07117.id, view_07117.status]
  }

  join: view_07119 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07117.user_id} = ${view_07119.id} ;;
    required_joins: []
  }

  join: view_07120 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07117.account_id} = ${view_07120.account_id} ;;
    required_joins: [view_07119]
  }

  join: view_07121 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07117.category} = ${view_07121.category} ;;
  }

  access_filter: {
    field: view_07117.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07117.is_deleted} = false ;;
}
