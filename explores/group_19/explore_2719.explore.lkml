# Explore: explore_2719
# Auto-generated LookML Explore File

include: "/views/domain_08/view_08158.view.lkml"
include: "/views/domain_10/view_08160.view.lkml"
include: "/views/domain_11/view_08161.view.lkml"
include: "/views/domain_12/view_08162.view.lkml"

explore: explore_2719 {
  label: "Explore Explore 2719"
  description: "Comprehensive analytics explore joining base view_08158 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_08158
  
  always_filter: {
    filters: [view_08158.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08158.created_at_date: "7 days"]
    unless: [view_08158.id, view_08158.status]
  }

  join: view_08160 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08158.user_id} = ${view_08160.id} ;;
    required_joins: []
  }

  join: view_08161 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08158.account_id} = ${view_08161.account_id} ;;
    required_joins: [view_08160]
  }

  join: view_08162 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08158.category} = ${view_08162.category} ;;
  }

  access_filter: {
    field: view_08158.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08158.is_deleted} = false ;;
}
