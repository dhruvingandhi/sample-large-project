# Explore: explore_0861
# Auto-generated LookML Explore File

include: "/views/domain_34/view_02584.view.lkml"
include: "/views/domain_36/view_02586.view.lkml"
include: "/views/domain_37/view_02587.view.lkml"
include: "/views/domain_38/view_02588.view.lkml"

explore: explore_0861 {
  label: "Explore Explore 0861"
  description: "Comprehensive analytics explore joining base view_02584 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_02584
  
  always_filter: {
    filters: [view_02584.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02584.created_at_date: "7 days"]
    unless: [view_02584.id, view_02584.status]
  }

  join: view_02586 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02584.user_id} = ${view_02586.id} ;;
    required_joins: []
  }

  join: view_02587 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02584.account_id} = ${view_02587.account_id} ;;
    required_joins: [view_02586]
  }

  join: view_02588 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02584.category} = ${view_02588.category} ;;
  }

  access_filter: {
    field: view_02584.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02584.is_deleted} = false ;;
}
