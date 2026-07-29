# Explore: explore_2441
# Auto-generated LookML Explore File

include: "/views/domain_24/view_07324.view.lkml"
include: "/views/domain_26/view_07326.view.lkml"
include: "/views/domain_27/view_07327.view.lkml"
include: "/views/domain_28/view_07328.view.lkml"

explore: explore_2441 {
  label: "Explore Explore 2441"
  description: "Comprehensive analytics explore joining base view_07324 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_07324
  
  always_filter: {
    filters: [view_07324.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07324.created_at_date: "7 days"]
    unless: [view_07324.id, view_07324.status]
  }

  join: view_07326 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07324.user_id} = ${view_07326.id} ;;
    required_joins: []
  }

  join: view_07327 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07324.account_id} = ${view_07327.account_id} ;;
    required_joins: [view_07326]
  }

  join: view_07328 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07324.category} = ${view_07328.category} ;;
  }

  access_filter: {
    field: view_07324.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07324.is_deleted} = false ;;
}
