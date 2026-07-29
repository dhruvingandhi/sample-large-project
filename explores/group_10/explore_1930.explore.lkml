# Explore: explore_1930
# Auto-generated LookML Explore File

include: "/views/domain_41/view_05791.view.lkml"
include: "/views/domain_43/view_05793.view.lkml"
include: "/views/domain_44/view_05794.view.lkml"
include: "/views/domain_45/view_05795.view.lkml"

explore: explore_1930 {
  label: "Explore Explore 1930"
  description: "Comprehensive analytics explore joining base view_05791 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_05791
  
  always_filter: {
    filters: [view_05791.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05791.created_at_date: "7 days"]
    unless: [view_05791.id, view_05791.status]
  }

  join: view_05793 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05791.user_id} = ${view_05793.id} ;;
    required_joins: []
  }

  join: view_05794 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05791.account_id} = ${view_05794.account_id} ;;
    required_joins: [view_05793]
  }

  join: view_05795 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05791.category} = ${view_05795.category} ;;
  }

  access_filter: {
    field: view_05791.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05791.is_deleted} = false ;;
}
