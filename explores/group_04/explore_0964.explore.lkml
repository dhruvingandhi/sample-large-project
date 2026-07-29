# Explore: explore_0964
# Auto-generated LookML Explore File

include: "/views/domain_43/view_02893.view.lkml"
include: "/views/domain_45/view_02895.view.lkml"
include: "/views/domain_46/view_02896.view.lkml"
include: "/views/domain_47/view_02897.view.lkml"

explore: explore_0964 {
  label: "Explore Explore 0964"
  description: "Comprehensive analytics explore joining base view_02893 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_02893
  
  always_filter: {
    filters: [view_02893.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02893.created_at_date: "7 days"]
    unless: [view_02893.id, view_02893.status]
  }

  join: view_02895 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02893.user_id} = ${view_02895.id} ;;
    required_joins: []
  }

  join: view_02896 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02893.account_id} = ${view_02896.account_id} ;;
    required_joins: [view_02895]
  }

  join: view_02897 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02893.category} = ${view_02897.category} ;;
  }

  access_filter: {
    field: view_02893.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02893.is_deleted} = false ;;
}
