# Explore: explore_0913
# Auto-generated LookML Explore File

include: "/views/domain_40/view_02740.view.lkml"
include: "/views/domain_42/view_02742.view.lkml"
include: "/views/domain_43/view_02743.view.lkml"
include: "/views/domain_44/view_02744.view.lkml"

explore: explore_0913 {
  label: "Explore Explore 0913"
  description: "Comprehensive analytics explore joining base view_02740 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_02740
  
  always_filter: {
    filters: [view_02740.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02740.created_at_date: "7 days"]
    unless: [view_02740.id, view_02740.status]
  }

  join: view_02742 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02740.user_id} = ${view_02742.id} ;;
    required_joins: []
  }

  join: view_02743 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02740.account_id} = ${view_02743.account_id} ;;
    required_joins: [view_02742]
  }

  join: view_02744 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02740.category} = ${view_02744.category} ;;
  }

  access_filter: {
    field: view_02740.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02740.is_deleted} = false ;;
}
