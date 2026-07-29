# Explore: explore_0774
# Auto-generated LookML Explore File

include: "/views/domain_23/view_02323.view.lkml"
include: "/views/domain_25/view_02325.view.lkml"
include: "/views/domain_26/view_02326.view.lkml"
include: "/views/domain_27/view_02327.view.lkml"

explore: explore_0774 {
  label: "Explore Explore 0774"
  description: "Comprehensive analytics explore joining base view_02323 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_02323
  
  always_filter: {
    filters: [view_02323.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02323.created_at_date: "7 days"]
    unless: [view_02323.id, view_02323.status]
  }

  join: view_02325 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02323.user_id} = ${view_02325.id} ;;
    required_joins: []
  }

  join: view_02326 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02323.account_id} = ${view_02326.account_id} ;;
    required_joins: [view_02325]
  }

  join: view_02327 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02323.category} = ${view_02327.category} ;;
  }

  access_filter: {
    field: view_02323.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02323.is_deleted} = false ;;
}
