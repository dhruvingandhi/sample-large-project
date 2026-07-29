# Explore: explore_3860
# Auto-generated LookML Explore File

include: "/views/domain_31/view_11581.view.lkml"
include: "/views/domain_33/view_11583.view.lkml"
include: "/views/domain_34/view_11584.view.lkml"
include: "/views/domain_35/view_11585.view.lkml"

explore: explore_3860 {
  label: "Explore Explore 3860"
  description: "Comprehensive analytics explore joining base view_11581 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_11581
  
  always_filter: {
    filters: [view_11581.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11581.created_at_date: "7 days"]
    unless: [view_11581.id, view_11581.status]
  }

  join: view_11583 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11581.user_id} = ${view_11583.id} ;;
    required_joins: []
  }

  join: view_11584 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11581.account_id} = ${view_11584.account_id} ;;
    required_joins: [view_11583]
  }

  join: view_11585 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11581.category} = ${view_11585.category} ;;
  }

  access_filter: {
    field: view_11581.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11581.is_deleted} = false ;;
}
