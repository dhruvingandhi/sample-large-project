# Explore: explore_3893
# Auto-generated LookML Explore File

include: "/views/domain_30/view_11680.view.lkml"
include: "/views/domain_32/view_11682.view.lkml"
include: "/views/domain_33/view_11683.view.lkml"
include: "/views/domain_34/view_11684.view.lkml"

explore: explore_3893 {
  label: "Explore Explore 3893"
  description: "Comprehensive analytics explore joining base view_11680 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_11680
  
  always_filter: {
    filters: [view_11680.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11680.created_at_date: "7 days"]
    unless: [view_11680.id, view_11680.status]
  }

  join: view_11682 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11680.user_id} = ${view_11682.id} ;;
    required_joins: []
  }

  join: view_11683 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11680.account_id} = ${view_11683.account_id} ;;
    required_joins: [view_11682]
  }

  join: view_11684 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11680.category} = ${view_11684.category} ;;
  }

  access_filter: {
    field: view_11680.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11680.is_deleted} = false ;;
}
