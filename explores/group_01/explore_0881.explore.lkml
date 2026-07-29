# Explore: explore_0881
# Auto-generated LookML Explore File

include: "/views/domain_44/view_02644.view.lkml"
include: "/views/domain_46/view_02646.view.lkml"
include: "/views/domain_47/view_02647.view.lkml"
include: "/views/domain_48/view_02648.view.lkml"

explore: explore_0881 {
  label: "Explore Explore 0881"
  description: "Comprehensive analytics explore joining base view_02644 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_02644
  
  always_filter: {
    filters: [view_02644.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02644.created_at_date: "7 days"]
    unless: [view_02644.id, view_02644.status]
  }

  join: view_02646 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02644.user_id} = ${view_02646.id} ;;
    required_joins: []
  }

  join: view_02647 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02644.account_id} = ${view_02647.account_id} ;;
    required_joins: [view_02646]
  }

  join: view_02648 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02644.category} = ${view_02648.category} ;;
  }

  access_filter: {
    field: view_02644.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02644.is_deleted} = false ;;
}
