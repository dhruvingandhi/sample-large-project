# Update for 2000 file diff target
# Explore: explore_0960
# Auto-generated LookML Explore File

include: "/views/domain_31/view_02881.view.lkml"
include: "/views/domain_33/view_02883.view.lkml"
include: "/views/domain_34/view_02884.view.lkml"
include: "/views/domain_35/view_02885.view.lkml"

explore: explore_0960 {
  label: "Explore Explore 0960"
  description: "Comprehensive analytics explore joining base view_02881 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_02881
  
  always_filter: {
    filters: [view_02881.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02881.created_at_date: "7 days"]
    unless: [view_02881.id, view_02881.status]
  }

  join: view_02883 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02881.user_id} = ${view_02883.id} ;;
    required_joins: []
  }

  join: view_02884 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02881.account_id} = ${view_02884.account_id} ;;
    required_joins: [view_02883]
  }

  join: view_02885 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02881.category} = ${view_02885.category} ;;
  }

  access_filter: {
    field: view_02881.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02881.is_deleted} = false ;;
}
