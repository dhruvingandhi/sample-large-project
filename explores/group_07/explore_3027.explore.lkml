# Explore: explore_3027
# Auto-generated LookML Explore File

include: "/views/domain_32/view_09082.view.lkml"
include: "/views/domain_34/view_09084.view.lkml"
include: "/views/domain_35/view_09085.view.lkml"
include: "/views/domain_36/view_09086.view.lkml"

explore: explore_3027 {
  label: "Explore Explore 3027"
  description: "Comprehensive analytics explore joining base view_09082 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_09082
  
  always_filter: {
    filters: [view_09082.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09082.created_at_date: "7 days"]
    unless: [view_09082.id, view_09082.status]
  }

  join: view_09084 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09082.user_id} = ${view_09084.id} ;;
    required_joins: []
  }

  join: view_09085 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09082.account_id} = ${view_09085.account_id} ;;
    required_joins: [view_09084]
  }

  join: view_09086 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09082.category} = ${view_09086.category} ;;
  }

  access_filter: {
    field: view_09082.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09082.is_deleted} = false ;;
}
