# Explore: explore_1192
# Auto-generated LookML Explore File

include: "/views/domain_27/view_03577.view.lkml"
include: "/views/domain_29/view_03579.view.lkml"
include: "/views/domain_30/view_03580.view.lkml"
include: "/views/domain_31/view_03581.view.lkml"

explore: explore_1192 {
  label: "Explore Explore 1192"
  description: "Comprehensive analytics explore joining base view_03577 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_03577
  
  always_filter: {
    filters: [view_03577.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03577.created_at_date: "7 days"]
    unless: [view_03577.id, view_03577.status]
  }

  join: view_03579 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03577.user_id} = ${view_03579.id} ;;
    required_joins: []
  }

  join: view_03580 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03577.account_id} = ${view_03580.account_id} ;;
    required_joins: [view_03579]
  }

  join: view_03581 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03577.category} = ${view_03581.category} ;;
  }

  access_filter: {
    field: view_03577.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03577.is_deleted} = false ;;
}
