# Explore: explore_2647
# Auto-generated LookML Explore File

include: "/views/domain_42/view_07942.view.lkml"
include: "/views/domain_44/view_07944.view.lkml"
include: "/views/domain_45/view_07945.view.lkml"
include: "/views/domain_46/view_07946.view.lkml"

explore: explore_2647 {
  label: "Explore Explore 2647"
  description: "Comprehensive analytics explore joining base view_07942 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_07942
  
  always_filter: {
    filters: [view_07942.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07942.created_at_date: "7 days"]
    unless: [view_07942.id, view_07942.status]
  }

  join: view_07944 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07942.user_id} = ${view_07944.id} ;;
    required_joins: []
  }

  join: view_07945 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07942.account_id} = ${view_07945.account_id} ;;
    required_joins: [view_07944]
  }

  join: view_07946 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07942.category} = ${view_07946.category} ;;
  }

  access_filter: {
    field: view_07942.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07942.is_deleted} = false ;;
}
