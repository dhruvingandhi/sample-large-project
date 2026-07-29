# Explore: explore_2931
# Auto-generated LookML Explore File

include: "/views/domain_44/view_08794.view.lkml"
include: "/views/domain_46/view_08796.view.lkml"
include: "/views/domain_47/view_08797.view.lkml"
include: "/views/domain_48/view_08798.view.lkml"

explore: explore_2931 {
  label: "Explore Explore 2931"
  description: "Comprehensive analytics explore joining base view_08794 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_08794
  
  always_filter: {
    filters: [view_08794.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08794.created_at_date: "7 days"]
    unless: [view_08794.id, view_08794.status]
  }

  join: view_08796 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08794.user_id} = ${view_08796.id} ;;
    required_joins: []
  }

  join: view_08797 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08794.account_id} = ${view_08797.account_id} ;;
    required_joins: [view_08796]
  }

  join: view_08798 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08794.category} = ${view_08798.category} ;;
  }

  access_filter: {
    field: view_08794.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08794.is_deleted} = false ;;
}
