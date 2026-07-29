# Explore: explore_1027
# Auto-generated LookML Explore File

include: "/views/domain_32/view_03082.view.lkml"
include: "/views/domain_34/view_03084.view.lkml"
include: "/views/domain_35/view_03085.view.lkml"
include: "/views/domain_36/view_03086.view.lkml"

explore: explore_1027 {
  label: "Explore Explore 1027"
  description: "Comprehensive analytics explore joining base view_03082 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_03082
  
  always_filter: {
    filters: [view_03082.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03082.created_at_date: "7 days"]
    unless: [view_03082.id, view_03082.status]
  }

  join: view_03084 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03082.user_id} = ${view_03084.id} ;;
    required_joins: []
  }

  join: view_03085 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03082.account_id} = ${view_03085.account_id} ;;
    required_joins: [view_03084]
  }

  join: view_03086 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03082.category} = ${view_03086.category} ;;
  }

  access_filter: {
    field: view_03082.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03082.is_deleted} = false ;;
}
