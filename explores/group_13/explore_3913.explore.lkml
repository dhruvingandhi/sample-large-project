# Explore: explore_3913
# Auto-generated LookML Explore File

include: "/views/domain_40/view_11740.view.lkml"
include: "/views/domain_42/view_11742.view.lkml"
include: "/views/domain_43/view_11743.view.lkml"
include: "/views/domain_44/view_11744.view.lkml"

explore: explore_3913 {
  label: "Explore Explore 3913"
  description: "Comprehensive analytics explore joining base view_11740 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_11740
  
  always_filter: {
    filters: [view_11740.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11740.created_at_date: "7 days"]
    unless: [view_11740.id, view_11740.status]
  }

  join: view_11742 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11740.user_id} = ${view_11742.id} ;;
    required_joins: []
  }

  join: view_11743 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11740.account_id} = ${view_11743.account_id} ;;
    required_joins: [view_11742]
  }

  join: view_11744 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11740.category} = ${view_11744.category} ;;
  }

  access_filter: {
    field: view_11740.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11740.is_deleted} = false ;;
}
