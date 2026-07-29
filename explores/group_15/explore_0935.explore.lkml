# Explore: explore_0935
# Auto-generated LookML Explore File

include: "/views/domain_06/view_02806.view.lkml"
include: "/views/domain_08/view_02808.view.lkml"
include: "/views/domain_09/view_02809.view.lkml"
include: "/views/domain_10/view_02810.view.lkml"

explore: explore_0935 {
  label: "Explore Explore 0935"
  description: "Comprehensive analytics explore joining base view_02806 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_02806
  
  always_filter: {
    filters: [view_02806.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02806.created_at_date: "7 days"]
    unless: [view_02806.id, view_02806.status]
  }

  join: view_02808 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02806.user_id} = ${view_02808.id} ;;
    required_joins: []
  }

  join: view_02809 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02806.account_id} = ${view_02809.account_id} ;;
    required_joins: [view_02808]
  }

  join: view_02810 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02806.category} = ${view_02810.category} ;;
  }

  access_filter: {
    field: view_02806.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02806.is_deleted} = false ;;
}
