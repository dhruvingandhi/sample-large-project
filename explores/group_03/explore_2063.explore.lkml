# Explore: explore_2063
# Auto-generated LookML Explore File

include: "/views/domain_40/view_06190.view.lkml"
include: "/views/domain_42/view_06192.view.lkml"
include: "/views/domain_43/view_06193.view.lkml"
include: "/views/domain_44/view_06194.view.lkml"

explore: explore_2063 {
  label: "Explore Explore 2063"
  description: "Comprehensive analytics explore joining base view_06190 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_06190
  
  always_filter: {
    filters: [view_06190.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06190.created_at_date: "7 days"]
    unless: [view_06190.id, view_06190.status]
  }

  join: view_06192 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06190.user_id} = ${view_06192.id} ;;
    required_joins: []
  }

  join: view_06193 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06190.account_id} = ${view_06193.account_id} ;;
    required_joins: [view_06192]
  }

  join: view_06194 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06190.category} = ${view_06194.category} ;;
  }

  access_filter: {
    field: view_06190.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06190.is_deleted} = false ;;
}
