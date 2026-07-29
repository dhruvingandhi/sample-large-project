# Explore: explore_0676
# Auto-generated LookML Explore File

include: "/views/domain_29/view_02029.view.lkml"
include: "/views/domain_31/view_02031.view.lkml"
include: "/views/domain_32/view_02032.view.lkml"
include: "/views/domain_33/view_02033.view.lkml"

explore: explore_0676 {
  label: "Explore Explore 0676"
  description: "Comprehensive analytics explore joining base view_02029 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_02029
  
  always_filter: {
    filters: [view_02029.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02029.created_at_date: "7 days"]
    unless: [view_02029.id, view_02029.status]
  }

  join: view_02031 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02029.user_id} = ${view_02031.id} ;;
    required_joins: []
  }

  join: view_02032 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02029.account_id} = ${view_02032.account_id} ;;
    required_joins: [view_02031]
  }

  join: view_02033 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02029.category} = ${view_02033.category} ;;
  }

  access_filter: {
    field: view_02029.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02029.is_deleted} = false ;;
}
