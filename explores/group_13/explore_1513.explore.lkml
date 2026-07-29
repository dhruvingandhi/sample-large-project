# Explore: explore_1513
# Auto-generated LookML Explore File

include: "/views/domain_40/view_04540.view.lkml"
include: "/views/domain_42/view_04542.view.lkml"
include: "/views/domain_43/view_04543.view.lkml"
include: "/views/domain_44/view_04544.view.lkml"

explore: explore_1513 {
  label: "Explore Explore 1513"
  description: "Comprehensive analytics explore joining base view_04540 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_04540
  
  always_filter: {
    filters: [view_04540.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04540.created_at_date: "7 days"]
    unless: [view_04540.id, view_04540.status]
  }

  join: view_04542 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04540.user_id} = ${view_04542.id} ;;
    required_joins: []
  }

  join: view_04543 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04540.account_id} = ${view_04543.account_id} ;;
    required_joins: [view_04542]
  }

  join: view_04544 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04540.category} = ${view_04544.category} ;;
  }

  access_filter: {
    field: view_04540.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04540.is_deleted} = false ;;
}
