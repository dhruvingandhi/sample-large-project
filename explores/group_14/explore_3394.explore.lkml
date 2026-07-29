# Explore: explore_3394
# Auto-generated LookML Explore File

include: "/views/domain_33/view_10183.view.lkml"
include: "/views/domain_35/view_10185.view.lkml"
include: "/views/domain_36/view_10186.view.lkml"
include: "/views/domain_37/view_10187.view.lkml"

explore: explore_3394 {
  label: "Explore Explore 3394"
  description: "Comprehensive analytics explore joining base view_10183 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_10183
  
  always_filter: {
    filters: [view_10183.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10183.created_at_date: "7 days"]
    unless: [view_10183.id, view_10183.status]
  }

  join: view_10185 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10183.user_id} = ${view_10185.id} ;;
    required_joins: []
  }

  join: view_10186 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10183.account_id} = ${view_10186.account_id} ;;
    required_joins: [view_10185]
  }

  join: view_10187 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10183.category} = ${view_10187.category} ;;
  }

  access_filter: {
    field: view_10183.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10183.is_deleted} = false ;;
}
