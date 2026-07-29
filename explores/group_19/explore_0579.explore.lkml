# Explore: explore_0579
# Auto-generated LookML Explore File

include: "/views/domain_38/view_01738.view.lkml"
include: "/views/domain_40/view_01740.view.lkml"
include: "/views/domain_41/view_01741.view.lkml"
include: "/views/domain_42/view_01742.view.lkml"

explore: explore_0579 {
  label: "Explore Explore 0579"
  description: "Comprehensive analytics explore joining base view_01738 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_01738
  
  always_filter: {
    filters: [view_01738.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01738.created_at_date: "7 days"]
    unless: [view_01738.id, view_01738.status]
  }

  join: view_01740 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01738.user_id} = ${view_01740.id} ;;
    required_joins: []
  }

  join: view_01741 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01738.account_id} = ${view_01741.account_id} ;;
    required_joins: [view_01740]
  }

  join: view_01742 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01738.category} = ${view_01742.category} ;;
  }

  access_filter: {
    field: view_01738.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01738.is_deleted} = false ;;
}
