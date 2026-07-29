# Explore: explore_0729
# Auto-generated LookML Explore File

include: "/views/domain_38/view_02188.view.lkml"
include: "/views/domain_40/view_02190.view.lkml"
include: "/views/domain_41/view_02191.view.lkml"
include: "/views/domain_42/view_02192.view.lkml"

explore: explore_0729 {
  label: "Explore Explore 0729"
  description: "Comprehensive analytics explore joining base view_02188 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_02188
  
  always_filter: {
    filters: [view_02188.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02188.created_at_date: "7 days"]
    unless: [view_02188.id, view_02188.status]
  }

  join: view_02190 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02188.user_id} = ${view_02190.id} ;;
    required_joins: []
  }

  join: view_02191 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02188.account_id} = ${view_02191.account_id} ;;
    required_joins: [view_02190]
  }

  join: view_02192 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02188.category} = ${view_02192.category} ;;
  }

  access_filter: {
    field: view_02188.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02188.is_deleted} = false ;;
}
