# Explore: explore_0281
# Auto-generated LookML Explore File

include: "/views/domain_44/view_00844.view.lkml"
include: "/views/domain_46/view_00846.view.lkml"
include: "/views/domain_47/view_00847.view.lkml"
include: "/views/domain_48/view_00848.view.lkml"

explore: explore_0281 {
  label: "Explore Explore 0281"
  description: "Comprehensive analytics explore joining base view_00844 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_00844
  
  always_filter: {
    filters: [view_00844.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00844.created_at_date: "7 days"]
    unless: [view_00844.id, view_00844.status]
  }

  join: view_00846 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00844.user_id} = ${view_00846.id} ;;
    required_joins: []
  }

  join: view_00847 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00844.account_id} = ${view_00847.account_id} ;;
    required_joins: [view_00846]
  }

  join: view_00848 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00844.category} = ${view_00848.category} ;;
  }

  access_filter: {
    field: view_00844.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00844.is_deleted} = false ;;
}
