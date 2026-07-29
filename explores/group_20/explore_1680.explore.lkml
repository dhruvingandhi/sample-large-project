# Explore: explore_1680
# Auto-generated LookML Explore File

include: "/views/domain_41/view_05041.view.lkml"
include: "/views/domain_43/view_05043.view.lkml"
include: "/views/domain_44/view_05044.view.lkml"
include: "/views/domain_45/view_05045.view.lkml"

explore: explore_1680 {
  label: "Explore Explore 1680"
  description: "Comprehensive analytics explore joining base view_05041 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_05041
  
  always_filter: {
    filters: [view_05041.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05041.created_at_date: "7 days"]
    unless: [view_05041.id, view_05041.status]
  }

  join: view_05043 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05041.user_id} = ${view_05043.id} ;;
    required_joins: []
  }

  join: view_05044 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05041.account_id} = ${view_05044.account_id} ;;
    required_joins: [view_05043]
  }

  join: view_05045 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05041.category} = ${view_05045.category} ;;
  }

  access_filter: {
    field: view_05041.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05041.is_deleted} = false ;;
}
