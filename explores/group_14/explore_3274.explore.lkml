# Explore: explore_3274
# Auto-generated LookML Explore File

include: "/views/domain_23/view_09823.view.lkml"
include: "/views/domain_25/view_09825.view.lkml"
include: "/views/domain_26/view_09826.view.lkml"
include: "/views/domain_27/view_09827.view.lkml"

explore: explore_3274 {
  label: "Explore Explore 3274"
  description: "Comprehensive analytics explore joining base view_09823 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_09823
  
  always_filter: {
    filters: [view_09823.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09823.created_at_date: "7 days"]
    unless: [view_09823.id, view_09823.status]
  }

  join: view_09825 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09823.user_id} = ${view_09825.id} ;;
    required_joins: []
  }

  join: view_09826 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09823.account_id} = ${view_09826.account_id} ;;
    required_joins: [view_09825]
  }

  join: view_09827 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09823.category} = ${view_09827.category} ;;
  }

  access_filter: {
    field: view_09823.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09823.is_deleted} = false ;;
}
