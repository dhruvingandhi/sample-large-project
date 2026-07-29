# Explore: explore_1706
# Auto-generated LookML Explore File

include: "/views/domain_19/view_05119.view.lkml"
include: "/views/domain_21/view_05121.view.lkml"
include: "/views/domain_22/view_05122.view.lkml"
include: "/views/domain_23/view_05123.view.lkml"

explore: explore_1706 {
  label: "Explore Explore 1706"
  description: "Comprehensive analytics explore joining base view_05119 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_05119
  
  always_filter: {
    filters: [view_05119.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05119.created_at_date: "7 days"]
    unless: [view_05119.id, view_05119.status]
  }

  join: view_05121 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05119.user_id} = ${view_05121.id} ;;
    required_joins: []
  }

  join: view_05122 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05119.account_id} = ${view_05122.account_id} ;;
    required_joins: [view_05121]
  }

  join: view_05123 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05119.category} = ${view_05123.category} ;;
  }

  access_filter: {
    field: view_05119.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05119.is_deleted} = false ;;
}
