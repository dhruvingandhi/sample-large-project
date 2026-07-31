# Antigravity modified: branch dg-3
# Explore: explore_0825
# Auto-generated LookML Explore File

include: "/views/domain_26/view_02476.view.lkml"
include: "/views/domain_28/view_02478.view.lkml"
include: "/views/domain_29/view_02479.view.lkml"
include: "/views/domain_30/view_02480.view.lkml"

explore: explore_0825 {
  label: "Explore Explore 0825"
  description: "Comprehensive analytics explore joining base view_02476 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_02476
  
  always_filter: {
    filters: [view_02476.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02476.created_at_date: "7 days"]
    unless: [view_02476.id, view_02476.status]
  }

  join: view_02478 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02476.user_id} = ${view_02478.id} ;;
    required_joins: []
  }

  join: view_02479 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02476.account_id} = ${view_02479.account_id} ;;
    required_joins: [view_02478]
  }

  join: view_02480 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02476.category} = ${view_02480.category} ;;
  }

  access_filter: {
    field: view_02476.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02476.is_deleted} = false ;;
}
