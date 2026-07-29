# Explore: explore_0394
# Auto-generated LookML Explore File

include: "/views/domain_33/view_01183.view.lkml"
include: "/views/domain_35/view_01185.view.lkml"
include: "/views/domain_36/view_01186.view.lkml"
include: "/views/domain_37/view_01187.view.lkml"

explore: explore_0394 {
  label: "Explore Explore 0394"
  description: "Comprehensive analytics explore joining base view_01183 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_01183
  
  always_filter: {
    filters: [view_01183.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01183.created_at_date: "7 days"]
    unless: [view_01183.id, view_01183.status]
  }

  join: view_01185 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01183.user_id} = ${view_01185.id} ;;
    required_joins: []
  }

  join: view_01186 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01183.account_id} = ${view_01186.account_id} ;;
    required_joins: [view_01185]
  }

  join: view_01187 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01183.category} = ${view_01187.category} ;;
  }

  access_filter: {
    field: view_01183.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01183.is_deleted} = false ;;
}
