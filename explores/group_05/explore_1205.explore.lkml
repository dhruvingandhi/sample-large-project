# Explore: explore_1205
# Auto-generated LookML Explore File

include: "/views/domain_16/view_03616.view.lkml"
include: "/views/domain_18/view_03618.view.lkml"
include: "/views/domain_19/view_03619.view.lkml"
include: "/views/domain_20/view_03620.view.lkml"

explore: explore_1205 {
  label: "Explore Explore 1205"
  description: "Comprehensive analytics explore joining base view_03616 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_03616
  
  always_filter: {
    filters: [view_03616.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03616.created_at_date: "7 days"]
    unless: [view_03616.id, view_03616.status]
  }

  join: view_03618 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03616.user_id} = ${view_03618.id} ;;
    required_joins: []
  }

  join: view_03619 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03616.account_id} = ${view_03619.account_id} ;;
    required_joins: [view_03618]
  }

  join: view_03620 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03616.category} = ${view_03620.category} ;;
  }

  access_filter: {
    field: view_03616.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03616.is_deleted} = false ;;
}
